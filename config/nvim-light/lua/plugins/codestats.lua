return {
  {
    'alex-robert/codestats.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'TextChanged', 'InsertEnter' },
    cmd = { 'CodeStatsXpSend', 'CodeStatsProfileUpdate' },
    config = function()
      require('codestats').setup {
        username = 'alex-robert',
        base_url = 'https://codestats.net',
        api_key = vim.env.CODESTATS_API_KEY,
        send_on_exit = true,
        send_on_timer = true,
        timer_interval = 60000,
        curl_timeout = 5,
      }
    end,
  },
}
