vim.cmd "hi clear"
vim.cmd "colorscheme default"

local to_link = {
    String = "Cyan"
}

function link(group, highlight)
    local cmd = "highlight! link " .. group .. " " .. highlight
    vim.cmd(cmd)
end

for key, value in pairs(to_link) do
    link(key, value)
end
