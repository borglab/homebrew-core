class Gtsam42 < Formula
  desc "Georgia Tech Smoothing and Mapping"
  homepage "https://gtsam.org"
  url "https://github.com/borglab/gtsam/archive/refs/tags/4.2.tar.gz"
  version "4.2"
  sha256 "809d817eac24acbcfb04358315b9bb8c9cdbda664b7a49c3c8c400b96d6dd945"
  license "BSD-2-Clause"

  depends_on "cmake" => :build

  depends_on "boost"

  on_macos do
    depends_on :xcode
  end
  on_linux do
    depends_on "g++"
    depends_on "gcc"
  end

  def install
    custom_cmake_args = [
      "-DCMAKE_BUILD_TYPE=Release",
      "-DGTSAM_BUILD_TESTS=OFF",
      "-DGTSAM_WITH_TBB=OFF",
      "-DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF",
      "-DGTSAM_ALLOW_DEPRECATED_SINCE_V42=OFF",
      "-DGTSAM_USE_QUATERNIONS=OFF",
      "-DGTSAM_ROT3_EXPMAP=ON",
      "-DGTSAM_POSE3_EXPMAP=ON",
      "-DGTSAM_USE_SYSTEM_EIGEN=OFF",
      "-DGTSAM_USE_SYSTEM_METIS=OFF",
      "-DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF"
    ]
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, *custom_cmake_args
      system "make", "-j4", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test gtsam`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
