local neorg = require('neorg')
neorg.setup {
  load = {
    ["core.defaults"] = {},  -- Loads default behaviour
    ["core.export"] = {}, -- Adds export functionality
    ["core.ui"] = {},
    ["core.ui.calendar"] = {},
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.dirman"] = {      -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/neorg/notes",
          personal = "~/neorg/personal",
          verv = "~/neorg/verv",
          ntnu = "~/neorg/ntnu",
        },
        default_workspace = "notes",
      },
    },
  },
}
