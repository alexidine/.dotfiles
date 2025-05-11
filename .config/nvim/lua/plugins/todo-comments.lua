return {

  -- [[ keywords recognized as todo comments ]]
  -- PERF: fully optimized
  -- HACK: weird code warning
  -- NOTE: adding a note
  -- TODO: do something
  -- FIX: this should be fixed
  -- WARNING: ???

  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { signs = false },
}
