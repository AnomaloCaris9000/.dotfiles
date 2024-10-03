local obsidian = require("obsidian")

obsidian.setup {
    workspaces = {
        {
            name = "brain",
            path = "~/Nextcloud/Obsidian/brain",
        },
    },

    completion = {
        nvim_cmp = true,
    }
}
