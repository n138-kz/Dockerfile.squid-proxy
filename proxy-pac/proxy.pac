function FindProxyForURL(url, host) {
    // ローカルアドレスや特定のセグメントはプロキシを通さない
    if (isPlainHostName(host) ||
        shExpMatch(host, "*.local") ||
        isInNet(dnsResolve(host), "10.0.0.0", "255.0.0.0") ||
        isInNet(dnsResolve(host), "172.16.0.0", "255.240.0.0") ||
        isInNet(dnsResolve(host), "192.168.0.0", "255.255.0.0")) {
        return "DIRECT";
    }

    // それ以外はすべて今回のSquidプロキシ（3128番）へ
    // ※ 172.21.x.x 等、ConoHa側のプロキシIPを指定してください
    return "PROXY 172.21.70.22:3128; DIRECT";
}