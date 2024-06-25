local alpha = require("alpha")

local themes = {
    dashboard = require("alpha.themes.dashboard"),
}

alpha.setup(themes.dashboard.config)
