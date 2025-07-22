local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("go", {
  s("ife", {
    t({ "if err != nil {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),
})

ls.add_snippets("go", {
  s("tt", {
    t("func "),
    i(1, "TestSomething"),
    t({ "(t *testing.T) {", "\ttests := []struct {", "\t\tname string", "\t}{" }),
    t({ "", "\t\t{", '\t\t\tname: "",' }),
    t({ "", "\t\t}," }),
    t({ "", "\t}", "", "\tfor _, tc := range tests {", "\t\tt.Run(tc.name, func(t *testing.T) {", "\t\t\t" }),
    i(0),
    t({ "", "\t\t})", "\t}", "}" }),
  }),
})

-- Function to generate the current time in Go's time.Date format
local function go_time_date()
  local now = os.date("!*t") -- UTC time
  return string.format(
    "time.Date(%d, %02d, %02d, %02d, %02d, %02d, 0, time.UTC)",
    now.year,
    now.month,
    now.day,
    now.hour,
    now.min,
    now.sec
  )
end

ls.add_snippets("go", {
  s("testnow", {
    f(go_time_date, {}),
  }),
})
