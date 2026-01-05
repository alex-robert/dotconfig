return {
    -- GitHub Copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = false,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<M-CR>", -- Alt/Option + Enter
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4
                    },
                },
                suggestion = {
                    enabled = false,
                    auto_trigger = false,
                    debounce = 75,
                    keymap = {
                        accept = "<M-l>",      -- Alt/Option + l
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",        -- Alt/Option + ]
                        prev = "<M-[>",        -- Alt/Option + [
                        dismiss = "<C-]>",     -- Ctrl + ]
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
                copilot_node_command = 'node', -- Node.js version must be > 18.x
                server_opts_overrides = {},
            })
        end,
    },

    -- Copilot Chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },
        opts = {
            debug = false,
            model = 'gpt-4',
            temperature = 0.1,
            question_header = '## User ',
            answer_header = '## Copilot ',
            error_header = '## Error ',
            prompts = {
                -- Explain = {
                --     prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
                -- },
                -- Review = {
                --     prompt = '/COPILOT_REVIEW Review the selected code.',
                --     callback = function(response, source)
                --         -- Custom callback if needed
                --     end,
                -- },
                -- Fix = {
                --     prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
                -- },
                -- Optimize = {
                --     prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readability.',
                -- },
                -- Docs = {
                --     prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
                -- },
                -- Tests = {
                --     prompt = '/COPILOT_GENERATE Please generate tests for my code.',
                -- },
                -- FixDiagnostic = {
                --     prompt = 'Please assist with the following diagnostic issue in file:',
                --     selection = require('CopilotChat.select').diagnostics,
                -- },
                -- Commit = {
                --     prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
                --     selection = require('CopilotChat.select').gitdiff,
                -- },
                -- CommitStaged = {
                --     prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
                --     selection = function(source)
                --         return require('CopilotChat.select').gitdiff(source, true)
                --     end,
                -- },
            },
            window = {
                layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
                width = 0.5,
                height = 0.5,
                relative = 'editor',
                width = 80,
            },
            mappings = {
                complete = {
                    detail = 'Use @<Tab> or /<Tab> for options.',
                    insert = '<Tab>',
                },
                close = {
                    normal = 'q',
                    insert = '<C-c>'
                },
                reset = {
                    normal = '<C-l>',
                    insert = '<C-l>'
                },
                submit_prompt = {
                    normal = '<CR>',
                    insert = '<C-s>'
                },
                accept_diff = {
                    normal = '<C-y>',
                    insert = '<C-y>'
                },
                yank_diff = {
                    normal = 'gy',
                },
                show_diff = {
                    normal = 'gd'
                },
                -- show_system_prompt = {
                --     normal = 'gp'
                -- },
                -- show_user_selection = {
                --     normal = 'gs'
                -- },
            },
            headers = {
              user = '👤 You',
              assistant = '🤖 Copilot',
              tool = '🔧 Tool',
            }
        },
        config = function(_, opts)
            local chat = require("CopilotChat")
            local select = require("CopilotChat.select")
            
            chat.setup(opts)

            -- Keymaps
            vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
            vim.keymap.set("v", "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
            
            -- vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "Explain code" })
            -- vim.keymap.set("v", "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "Review code" })
            -- vim.keymap.set("v", "<leader>cf", "<cmd>CopilotChatFix<cr>", { desc = "Fix code" })
            -- vim.keymap.set("v", "<leader>co", "<cmd>CopilotChatOptimize<cr>", { desc = "Optimize code" })
            -- vim.keymap.set("v", "<leader>cd", "<cmd>CopilotChatDocs<cr>", { desc = "Document code" })
            -- vim.keymap.set("v", "<leader>ct", "<cmd>CopilotChatTests<cr>", { desc = "Generate tests" })
            -- vim.keymap.set("n", "<leader>cD", "<cmd>CopilotChatFixDiagnostic<cr>", { desc = "Fix diagnostic" })
            -- vim.keymap.set("n", "<leader>cm", "<cmd>CopilotChatCommit<cr>", { desc = "Generate commit message" })
            -- vim.keymap.set("n", "<leader>cM", "<cmd>CopilotChatCommitStaged<cr>", { desc = "Generate commit for staged" })
            
            -- -- Quick chat with buffer
            -- vim.keymap.set("n", "<leader>cq", function()
            --     local input = vim.fn.input("Quick Chat: ")
            --     if input ~= "" then
            --         chat.ask(input, { selection = select.buffer })
            --     end
            -- end, { desc = "Quick chat" })
            
            -- Quick chat with visual selection
            -- vim.keymap.set("v", "<leader>cq", function()
            --     local input = vim.fn.input("Quick Chat: ")
            --     if input ~= "" then
            --         chat.ask(input, { selection = select.visual })
            --     end
            -- end, { desc = "Quick chat with selection" })
        end,
        keys = {
            { "<leader>cc", mode = { "n", "v" }, desc = "Toggle Copilot Chat" },
            -- { "<leader>ce", mode = "v", desc = "Explain code" },
            -- { "<leader>cr", mode = "v", desc = "Review code" },
            -- { "<leader>cf", mode = "v", desc = "Fix code" },
            -- { "<leader>co", mode = "v", desc = "Optimize code" },
            -- { "<leader>cd", mode = "v", desc = "Document code" },
            -- { "<leader>ct", mode = "v", desc = "Generate tests" },
            -- { "<leader>cD", mode = "n", desc = "Fix diagnostic" },
            -- { "<leader>cm", mode = "n", desc = "Generate commit" },
            { "<leader>cq", mode = { "n", "v" }, desc = "Quick chat" },
        },
    },
}
