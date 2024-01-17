lvim.builtin.which_key.mappings['n'] = {
  name = '+Neotest',
  o = { "<cmd>lua require'neotest'.summary.open()<cr>", "summary open" },
  c = { "<cmd>lua require'neotest'.summary.close()<cr>", "summary close" },
  r = { "<cmd>lua require'neotest'.run.run()<cr>", "run start" },
  R = { "<cmd>lua require'neotest'.run.stop()<cr>", "run stop" },
  a = { "<cmd>lua require'neotest'.run.attach()<cr>", "run attach" },
  d = { "<cmd>lua require'neotest'.run.run({estrategy = 'dap'})<cr>", "run dap" },
}
