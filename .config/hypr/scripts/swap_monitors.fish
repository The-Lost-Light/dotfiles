#!/usr/bin/env fish

set workspace_id (hyprctl monitors -j | jq -r '.[] | .activeWorkspace.id')
set windows1_addresses (hyprctl clients -j | jq -r --arg id $workspace_id[1] '.[] | select(.workspace.id == ($id | tonumber)) | .address')
set windows2_addresses (hyprctl clients -j | jq -r --arg id $workspace_id[2] '.[] | select(.workspace.id == ($id | tonumber)) | .address')

echo "$windows1_addresses" | xargs -n 1 | xargs -I {} hyprctl dispatch movetoworkspacesilent "$workspace_id[2]",address:{}
echo "$windows2_addresses" | xargs -n 1 | xargs -I {} hyprctl dispatch movetoworkspacesilent "$workspace_id[1]",address:{}
