#!/usr/bin/env python3

import json
import time
import sys
import threading
import os
import queue
import re
import psutil

#if os.fork() == 0:
    #os.system("alacritty -e sh -c 'cat /proc/{}/fd/0'".format(os.getppid()))

def notify(msg = "hello"):
    os.system("notify-send {}".format(msg))

class Header: # TODO: make fields global
    def __init__(self):
        self.version: int = 1
        self.click_events: bool = True
    def __repr__(self):
        return json.dumps(self.__dict__)

class Block:

    module_name: str = "default"

    def __init__(self):
        self.instance = str(id(self))
        self.urgent = False
        self.color = "#FFFFFF"

    def as_dict(self) -> dict:
        res= self.__dict__
        res["name"] = self.__class__.module_name
        return res
    
    def on_tick(self): pass

    def on_event(self, event): pass

class StatusLine:

    def __init__(self):
        self.blocks: list[Block] = []

    def push(self, blk: Block):
        self.blocks.append(blk)

    def on_tick(self):
        for blk in self.blocks:
            blk.on_tick()

    def on_event(self, event):
        pass

    def __repr__(self):
        return json.dumps([blk.as_dict() for blk in self.blocks])

class Clock(Block):

    module_name: str = "clock"

    def __init__(self):
        super().__init__()
        self.battery = psutil.sensors_battery()

    def on_tick(self):
        self.full_text = time.ctime()

    def on_event(self, event):
        os.system("{}/sway/script.sh".format(os.environ["XDG_CONFIG_HOME"]))

class Bat(Block):

    module_name: str = "bat"

    def __init__(self):
        super().__init__()
        self.battery = psutil.sensors_battery()

    def on_tick(self):
        self.battery = psutil.sensors_battery()
        self.full_text = str(self.battery.percent)

header = Header()
status_line = StatusLine()

clock = Clock()
bat = Bat()

status_line.push(clock)
status_line.push(bat)

event_queue = queue.Queue()

def listen_event():
    while True:
        line: str = sys.stdin.readline()
        match: re.Match = re.search("\{.*\}", line)
        if match != None:
            event_str: str = match.group()
            event = json.loads(event_str)
            event_queue.put(event)
        
def send_bar():
 
    print(header)
    print("[", end = "")
    while True:
        status_line.on_tick()
        while not event_queue.empty():
            event = event_queue.get() 
            status_line.on_event(event)
        print(status_line, end = ",")
        sys.stdout.flush()
        time.sleep(1)


def main():
    event_thread = threading.Thread(target = listen_event, daemon=True)
    event_thread.start()
    send_bar()

main()
