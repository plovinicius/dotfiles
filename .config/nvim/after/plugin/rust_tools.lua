local status, rt = pcall(require, "rust-tools")
if (not status) then return end

rt.setup {
  tools = {
    inlay_hints = {
      auto = false
    }
  },
}
