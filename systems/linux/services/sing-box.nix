{ ... }:

{
  services.sing-box = {
    enable = true;
    settings = {
      dns = {
        strategy = "ipv4_only";
        reverse_mapping = true;
        servers = [
          {
            type = "https";
            tag = "dns-global";
            server = "8.8.8.8";
            tls.server_name = "dns.google";
          }
        ];
      };
      inbounds = [
        {
          type = "tun";
          address = [ "172.19.0.1/30" ];
          auto_route = true;
          auto_redirect = true;
          strict_route = true;
          stack = "system";
        }
      ];
      outbounds = [
        {
          type = "hysteria2";
          tag = "proxy";
          server = {
            _secret = "/etc/secrets/hysteria/server";
          };
          server_port = {
            _secret = "/etc/secrets/hysteria/server_port";
            quote = false;
          };
          password = {
            _secret = "/etc/secrets/hysteria/auth";
          };
          tls = {
            enabled = true;
            server_name = {
              _secret = "/etc/secrets/hysteria/server_name";
            };
          };
        }
        {
          type = "direct";
          tag = "direct";
        }
      ];
      route = {
        auto_detect_interface = true;
        rule_set = [
          {
            type = "remote";
            tag = "category-ru";
            format = "binary";
            url = "https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-category-ru.srs";
          }
        ];
        rules = [
          {
            action = "sniff";
          }
          {
            protocol = "dns";
            action = "hijack-dns";
          }
          {
            action = "resolve";
          }
          {
            ip_is_private = true;
            outbound = "direct";
          }
          {
            rule_set = [ "category-ru" ];
            outbound = "direct";
          }
        ];
      };
    };
  };
}
