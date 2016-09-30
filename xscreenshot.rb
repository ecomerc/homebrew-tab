# Documentation: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Xscreenshot < Formula
  desc "A reincarnation of the screenshot gem for fastlane that works for Xamarin.Forms apps"
  homepage "https://github.com/ecomerc/xscreenshot"
  url "https://github.com/ecomerc/xscreenshot/archive/v0.9.1.tar.gz"
  version "0.9.1"
  sha256 ""

  # depends_on "cmake" => :build
  # we require xamarin 

  def install
	system "nuget", "restore", "Source/"
	system "xbuild", "/p:Configuration=Release", "Source/xscreenshot.sln"
	bin.install Dir["Source/bin/Release/*"]
  end

  test do
    system "mono", "#{bin}/program", "test" 
  end
end
