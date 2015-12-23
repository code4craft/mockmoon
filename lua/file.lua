cjson = require "cjson"
local url = ngx.var.uri .. "?" .. ngx.var.args
local configFile = io.open(ngx.var.configFile, "r")
local config = cjson.decode(configFile:read("*all"))

function match(rule,file)
    local m, err = ngx.re.match(url,rule)
    if m then
        ngx.header["Content-type"] = "application/json"
        local f= io.open(file,"r")
        local t= f:read("*all")
        ngx.print(t)
    end
end
table.foreach(config,match)