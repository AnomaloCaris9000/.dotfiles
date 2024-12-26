local jdtls_install_location = "/usr/share/java/jdtls"

local config = {

    cmd = {
        jdtls_install_location .. "/bin/jdtls",
    },

    root_dir = require('jdtls.setup').find_root({ "build.xml", ".git" }),

    settings = {
        java = {
        }
    },

    init_options = {
        bundles = {}
    },
}

require('jdtls').start_or_attach(config)
