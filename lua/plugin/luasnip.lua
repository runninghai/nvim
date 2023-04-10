local ls = require('luasnip')
ls.setup()

local snip = ls.snippet
local func = ls.function_node
local text = ls.text_node
local insert = ls.insert_node

local date = function() return { os.date('%Y-%m-%d') } end
local logtime = function() return { os.date('%Y-%m-%d %H:%M:%S') } end
ls.add_snippets(nil, {
    markdown = {
        snip({
                trig = "date",
                namr = "Date",
                dscr = "Date in the form of YYYY-MM-DD",
            },
            {
                func(date, {}),
            }),
        snip({
                trig = "link",
                namr = "markdown_link",
                dscr = "Create markdown link [txt](url)"
            },
            {
                text('['),
                insert(1),
                text(']('),
                func(function(_, snip)
                    return snip.env.TM_SELECTED_TEXT[1] or {}
                end, {}),
                text(')'),
                insert(0),
            }),
        snip({
                trig = "image",
                namr = "markdown_image",
                dscr = "Create markdown image ![txt](url)"
            },
            {
                text('!['),
                insert(1),
                text(']('),
                func(function(_, snip)
                    return snip.env.TM_SELECTED_TEXT[1] or {}
                end, {}),
                text(')'),
                insert(0),
            }),
        snip({
                trig = "log",
                namr = "log",
                dscr = "generate a log info"
            },
            {
                text { '# ' }, func(logtime, {}),
                text { '', '## 任务', '' },
                insert(1, "Task"),
                text { '', '## 内容' },
                insert(0),
            }),
    }
})

ls.config.set_config({
    store_selection_keys = '<c-s>',
})
