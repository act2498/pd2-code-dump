--hook to lib/managers/chatmanager
--change 'kick_on'

function ChatManager:receive_message_by_peer(channel_id, peer, message)
	local color_id = peer:id()
	local color = tweak_data.chat_colors[color_id] or tweak_data.chat_colors[#tweak_data.chat_colors]
	local rank = peer:level() == nil and managers.experience:current_rank() or peer:rank()
	local icon = managers.experience:rank_icon(rank)
	local name = peer:name()

	kick_on = {
		'a',
		'b',
		'c'
	}
	for _, v in pairs(kick_on) do
		if string.find(name,v) or string.find(message,v) then
			managers.network:session():send_to_peers("kick_peer", peer:id(), 6)
			managers.network:session():on_peer_kicked(peer, peer:id(), 6)
			return
		end
	end

	self:_receive_message(channel_id, name, message, tweak_data.chat_colors[color_id] or tweak_data.chat_colors[#tweak_data.chat_colors], icon)
end

