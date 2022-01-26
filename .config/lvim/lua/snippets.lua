-- See https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua for examples.
local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
	return args[1]
end

ls.snippets = {
  -- These configurations are for R markdown with bookdown.
  rmd = {
    -- Display math.
    s("dm", {
      t({"\\[", ""}),
      i(0), t("."),
      t({"", "\\]"}),
    }),
    -- Display math with split.
    s("split", {
      t({"$$", ""}),
      t({"\\begin{split}", ""}),
      i(0),
      t({"", "\\end{split}"}),
      t({"", "$$"}),
    }),
    -- Code block.
    s("code", {
      t("```{."), i(1), t({"}", ""}),
      i(0),
      t({"", "```"}),
    }),
    -- Code block with line numbers.
    s("coden", {
      t("```{."), i(1), t({" .number-lines}", ""}),
      i(0),
      t({"", "```"}),
    }),
    -- Inserts an example block.
    s("exm", {
      t(":::{.example name=\""), i(1), t({"\"}", ""}),
      i(0),
      t({"", ":::"}),
    }),
    -- Inserts a theorem block.
    s("thm", {
      t(":::{.theorem name=\""), i(1), t({"\"}", ""}),
      i(0),
      t({"", ":::"}),
    }),
    -- Inserts a definition block.
    s("dfn", {
      t(":::{.definition name=\""), i(1), t({"\"}", ""}),
      i(0),
      t({"", ":::"}),
    }),
    -- Inserts a proof block.
    s("prf", {
      t({":::{.proof}", ""}),
      i(0),
      t({"", ":::"}),
    }),
    -- Inserts \text.
    s("txt", {
      t("\\text{"), i(0), t("}"),
    }),
    -- Insert image using knitr.
    s("fig", {
      t("```{r "), i(1), t(", fig.cap=\""), i(0), t("\""),
      t({"}", "knitr::include_graphics(\""}),
      t("assets/"), f(copy, 1), t(".png"),
      t({"\")", "```"}),
    }),
    -- Insert two images using knitr, side by side.
    s("figc", {
      t("```{r "), i(1), t(", fig.cap=\""), i(0), t("\", fig.show=\"hold\", fig.align=\"center\""),
      t({"}", "knitr::include_graphics(\""}),
      t("assets/"), f(copy, 1), t(".png"),
      t({"\")", "```"}),
    }),
    -- Insert \mathbb{}.
    s("mbb", {
      t("\\mathbb{"), i(0), t("}"),
    }),
    s("mbbz", {
      t("\\mathbb{Z}"),
    }),
    -- Insert &nbsp;
    s("nb", {
      t("&nbsp", "" ,""),
    }),
    -- Inserts \quad\text{and}\quad
    s("qand", {
      t("\\quad\\text{and}\\quad"),
    }),
    -- Inserts bookdown reference syntax.
    s("figref", {
      t("figure \\@ref(fig:"),
      i(0), -- Reference label.
      t(")"),
    }),
    s("tabref", {
      t("table \\@ref(tab:"),
      i(0), -- Reference label.
      t(")"),
    }),
    s("exmref", {
      t("example \\@ref(exm:"),
      i(0), -- Reference label.
      t(")"),
    }),
    -- Table caption.
    s("tabcap", {
      t("Table: (#tab:"), i(1), t(")"), i(0),
    }),
    -- Fraction.
    s("frac", {
      t("\\frac{"), i(1), t("}{"), i(0), t("}"),
    }),
  }
}

