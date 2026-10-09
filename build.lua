-- l3build configuration for zmath

module = "zmath"

-- The version is read from \ProvidesPackage in zmath.sty, the single source of
-- truth. `l3build tag vX.Y.Z` rewrites it (see update_tag below).
local function read(path)
  local file = assert(io.open(path, "rb"))
  local text = file:read("*a")
  file:close()
  return text
end

local pkgversion = read("zmath.sty"):match("\\ProvidesPackage{zmath}%[%d+/%d+/%d+ v([%d%.]+)")
assert(pkgversion, "cannot read the version from \\ProvidesPackage in zmath.sty")

sourcefiles  = {"zmath.sty"}                 -- no .dtx/.ins: the .sty is the source
unpackfiles  = {}                            -- nothing to extract
typesetfiles = {"zmath.tex"}                 -- the manual
docfiles     = {"zmath-listings.tex"}        -- file the manual \input's
textfiles    = {"README.md", "LICENSE*"}
typesetexe   = "lualatex"                    -- unicode-math needs LuaTeX or XeTeX
tagfiles     = {"zmath.sty", "zmath.tex"}

-- `l3build tag v1.2.3` updates version and date in the .sty and the manual title
function update_tag(file, content, tagname, tagdate)
  local version = ((tagname or pkgversion):gsub("^v", ""))
  local date    = (tagdate:gsub("%-", "/"))
  if file:match("%.sty$") then
    return (content:gsub("(\\ProvidesPackage{zmath}%[)%d+/%d+/%d+ v[%d%.]+",
      function(head) return head .. date .. " v" .. version end))
  end
  return (content:gsub("(\\today\\quad v)[%d%.]+",
    function(head) return head .. version end))
end

local repository = "https://github.com/tplobo/zmath"

uploadconfig = {
  pkg          = module,
  version      = pkgversion,
  author       = "Tiago Pomella Lobo",
  uploader     = "Tiago Pomella Lobo",
  maintainer   = "Tiago Pomella Lobo",
  email        = os.getenv("CTAN_EMAIL"),
  license      = "lppl1.3c",
  summary      = "Smart math typesetting utilities for LuaLaTeX and XeLaTeX",
  description  = [[zmath collects configurable math typesetting commands: integrals with flexible limit placement (\zint), fractions (\zfrac), four-way scripts (\zscript), primes (\zprime), limits (\zlim), differentials and derivatives (\zdiff), scaled function arguments (\zarg), vector and matrix underlines (\zline, \zvec, \zmat), evaluation bars (\zcond), a dot-product operator (\zdot), uniform scaling (\zscale) and equation punctuation (\zpunct). Every tunable parameter is a package option.]],
  topic        = {"maths"},
  ctanPath     = "/macros/latex/contrib/" .. module,
  repository   = repository,
  development  = repository,
  bugtracker   = repository .. "/issues",
  announcement = "Release v" .. pkgversion .. ". See the change history in the manual.",
  note         = "Uploaded automatically by l3build.",
}