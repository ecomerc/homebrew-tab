# Documentation: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Xscreenshot < Formula
  desc "A reincarnation of the screenshot gem for fastlane that works for Xamarin.Forms apps"
  homepage "https://github.com/ecomerc/xscreenshot"
  url "https://github.com/ecomerc/xscreenshot/archive/v0.9.24.tar.gz"
  version "0.9.24"
  sha256 "87854d6009206ca8b47316f361e23d5b2fd1543b3063aabd1b03c4a3273e38ba"

  depends_on "coreutils"
  # we require xamarin 

  def install
	system "/usr/local/bin/nuget", "restore", "Source/"
	system "/usr/local/bin/xbuild", "/p:Configuration=Release", "Source/xscreenshot.sln"
	bin.install Dir["Source/bin/Release/*"]
	bin.install Dir["Scripts/*"]
	lib.install Dir["lib/*"]
    system "/usr/local/bin/mono", "#{bin}/xscreenshot.exe", "--init" 
  end

  test do
    system "/usr/local/bin/mono", "#{bin}/xscreenshot.exe", "test" 
  end
end
