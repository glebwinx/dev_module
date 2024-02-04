from conan import ConanFile
from conan.tools.cmake import CMakeToolchain, CMakeDeps

class DevOpsConan(ConanFile):
    name = "boost_conan"
    settings = "os", "compiler", "build_type", "arch"
    version = "1.0"
    generators = "CMakeDeps", "CMakeToolchain"

    def requirements(self):
        self.requires("fmt/10.2.1")
