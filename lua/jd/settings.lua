local M = {
    vue_typescript_plugin_path = "",
    typescript_path = "",
}

local ok, local_settings = pcall(require, "local_settings")
if ok and type(local_settings) == "table" then
    for k, v in pairs(local_settings) do
        M[k] = v
    end
end

return M
