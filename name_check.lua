--hook to lib/network/base/networkpeer

Hooks:PostHook(NetworkPeer, "set_ip_verified", "add_on_name_check", function(self, state)
    local user = Steam:user(self:ip())
    check = {
		    'a',
		    'b',
		    'c'
    }
    if user then
        string = self:name()
        for _, v in pairs(check) do
            if string.find(string,v) then
                string=string.gsub(string,v,'*')
            end
        end
    end
end)

