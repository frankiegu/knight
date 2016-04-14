local knightConfig 	   = require "config.knight".run()
local systemConf 	   = require "config.init"
local statsPrefixConf  = systemConf.statsPrefixConf
local statsMatchConf   = systemConf.statsMatchConf

--local statsCache 	   = ngx.shared.stats
--local statsAllCache    = ngx.shared.statsAll
--local statsMatchCache  = ngx.shared.statsMatch
local ngx_shared       = ngx.shared
--[[
if jit then 
    ngx.say(jit.version) 
else 
    ngx.say(_VERSION) 
end
]]--

--ngx.say(statsMatchCache:get(statsPrefixConf.http_total .. 'api.model.xxxx'))
--ngx.say(ngx.var.args)

local keys = ngx_shared['statsMatch']:get_keys(0)
function dump(o)
    if type(o) == 'table' then
        local s = ''
        for k,v in pairs(o) do
            if type(k) ~= 'number'
            then
                sk = '"'..k..'"'
            else
                sk =  k
            end
            s = s .. ', ' .. '['..sk..'] = ' .. dump(v)
        end
        s = string.sub(s, 3)
        return '{ ' .. s .. '} '
    else
        return tostring(o)
    end
end

-- 过滤nginx无法处理请求

--ngx.say(ngx.var.request_time)
ngx.say(dump(keys))





--local stats = require "apps.lib.stats"
--local a = stats:new(1,2,3,4,5)
--ngx.say(dump(a))
--a:incrStatsNumCache(statsCache,statsPrefixConf)