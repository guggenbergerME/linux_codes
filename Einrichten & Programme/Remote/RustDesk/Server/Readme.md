# Rustdesk Server Docker Installation

```
sudo docker image pull rustdesk/rustdesk-server
sudo docker run --name hbbs -v ./data:/root -td --net=host --restart unless-stopped rustdesk/rustdesk-server hbbs
sudo docker run --name hbbr -v ./data:/root -td --net=host --restart unless-stopped rustdesk/rustdesk-server hbbr
```
## Set port forwarding on your router/VPS

Go to your router’s admin webpage, find anything related to Port forwarding, it should appear in WAN or Firewall settings.

If you still can’t find the setting, Google search {Router brand} + port forwarding or {Router model} + port forwarding. If this device is from your ISP, ask them.

If you’re using VPS, Google search {VPS vendor name} + firewall port to find the specific procedure for your VPS.

Open these required ports:

    21114 TCP for web console, only available in Pro version
    21115 TCP for NAT type test
    21116 TCP TCP hole punching
    21116 UDP heartbeat/ID server
    21117 TCP relay
    21118/21119 TCP for web socket if you want to run web client
