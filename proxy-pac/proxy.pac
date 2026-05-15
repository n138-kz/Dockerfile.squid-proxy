function FindProxyForURL(url, host) {
    /* ローカルアドレスや特定のセグメントはプロキシを通さない */
    if (isPlainHostName(host) ||
        shExpMatch(host, "*.local") ||
        isInNet(dnsResolve(host), "10.0.0.0", "255.0.0.0") ||
        isInNet(dnsResolve(host), "172.16.0.0", "255.240.0.0") ||
        isInNet(dnsResolve(host), "192.168.0.0", "255.255.0.0") ||
        shExpMatch(host, "*.n138.jp") ||
        dnsDomainIs(host, "hulu.jp") ||
        shExpMatch(host, "*.hulu.jp") ||
        shExpMatch(host, "*.happyon.jp") ||
        shExpMatch(host, "*.prod.hjholdings.tv") ||
	shExpMatch(host, "*.discord.media") ||
	shExpMatch(host, "*.discord.gg") ||
	shExpMatch(host, "*.discordapp.com") ||
	shExpMatch(host, "*.discord.com") ||
	shExpMatch(host, "*.gofile.io")
    ) {
        return "DIRECT";
    }

    /* それ以外はすべてSquidプロキシへ */
    return "PROXY 172.21.70.22:3128; DIRECT";
}
