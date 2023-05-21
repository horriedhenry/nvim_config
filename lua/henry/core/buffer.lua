--Update the buffer when the window is not active
local uv = vim.loop
local api = vim.api
local interval = 1 -- Update interval in milliseconds

-- Function to update the buffer
local function updateBuffer()
  api.nvim_command('silent! checktime')
end

-- Set up the polling timer
local timer

-- Start the polling timer when Neovim has finished initializing
api.nvim_command('autocmd VimEnter * lua startPolling()')

-- Function to start the polling timer
function StartPolling()
  timer = uv.new_timer()
  uv.timer_start(timer, interval, interval, function()
    vim.schedule(updateBuffer)
  end)
end

