require 'bufferline' . setup {
  options = {
    numbers = function(opts)
      return string.format('%s.', opts.ordinal)
    end,
  }
}
