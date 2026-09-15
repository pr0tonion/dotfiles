-- master is archived upstream and main is a rewrite with a different API; stay pinned until migrating
return {{"nvim-treesitter/nvim-treesitter", branch = "master", build = ":TSUpdate"}}
