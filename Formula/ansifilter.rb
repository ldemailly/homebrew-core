class Ansifilter < Formula
  desc "Strip or convert ANSI codes into HTML, (La)Tex, RTF, or BBCode"
  homepage "http://www.andre-simon.de/doku/ansifilter/ansifilter.html"
  url "http://www.andre-simon.de/zip/ansifilter-2.2.tar.bz2"
  sha256 "af862f9c381100d9307fa20a7cc66888bf582581249c0fc79b2447dbc41c30b9"

  bottle do
    cellar :any_skip_relocation
    sha256 "cefc6a4b4b4d5fe734f32eb82d7e44466446a7e1db1b668247d8d7555346a087" => :el_capitan
    sha256 "33e9a263b7a7a93602198a3ea66b557de06b3968f48200d3505c08c13b01b08b" => :yosemite
    sha256 "ecc1f91980b4abaa2bfdf2ac7e0f8392ac6354406ca57ec161ec448859cda33a" => :mavericks
  end

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    path = testpath/"ansi.txt"
    path.write "f\x1b[31moo"

    assert_equal "foo", shell_output("#{bin}/ansifilter #{path}").strip
  end
end
