# Documentation: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Xscreenshot < Formula
  desc "A reincarnation of the screenshot gem for fastlane that works for Xamarin.Forms apps"
  homepage "https://github.com/ecomerc/xscreenshot"
  url "https://github.com/ecomerc/xscreenshot/archive/v0.9.1.tar.gz"
  version "0.9.1"
  sha256 "91ab6b5d7d7c2fab56dcf3602b399381895215648ece57cde08a6e866e834d00"

  # depends_on "cmake" => :build
  # we require xamarin 

  def install
	system "/usr/local/bin/nuget", "restore", "Source/"
	system "/usr/local/bin/xbuild", "/p:Configuration=Release", "Source/xscreenshot.sln"
	bin.install Dir["Source/bin/Release/*"]
  end

  test do
    system "/usr/local/bin/mono", "#{bin}/program", "test" 
  end
end
