class Sngrep < Formula
  desc "Command-line tool for displaying SIP calls message flows"
  homepage "https://github.com/irontec/sngrep"
  url "https://github.com/irontec/sngrep/archive/v1.4.4.tar.gz"
  sha256 "2379b8b3e9498d426a0bc03b90d74170a80f98f167f89c126d53dcc66bc5f60b"

  bottle do
    sha256 "f90b4972aa9b5c1b3700ebdd07202dc30b678c826a159c12b23bc0d7180a92c9" => :high_sierra
    sha256 "08bd1a20db915fe10ab3c945100932353b7587154a9ed0c2064d297a26959cd8" => :sierra
    sha256 "142bfb041ad655637c0ffd97266ba22555821e5c2c0b8efea3724650e22e8d9d" => :el_capitan
    sha256 "77409d150899b54bafebe6ced0472528e7c9b9929e9fb4c219d00bb1582958b2" => :yosemite
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "openssl"

  def install
    system "./bootstrap.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--with-openssl=#{Formula["openssl"].opt_prefix}"
    system "make", "install"
  end

  test do
    system bin/"sngrep", "-NI", test_fixtures("test.pcap")
  end
end
