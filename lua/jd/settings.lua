SETTINGS = {}

if _ENV == 'Mac' then
    SETTINGS['vue_typescript_plugin_path'] = '/opt/homebrew/lib/node_modules/@vue/typescript-plugin/'
    SETTINGS['typescript_path'] = '/opt/homebrew/lib/node_modules/typescript/lib'
end

if _ENV == 'Ubuntu' then
    SETTINGS['vue_typescript_plugin_path'] = '/home/jd/.nvm/versions/node/v20.13.1/lib/node_modules/@vue/typescript-plugin'
    SETTINGS['typescript_path'] = '/home/jd/.nvm/versions/node/v20.13.1/lib/node_modules/typescript/lib'
end
