{ lib, stdenv, fetchFromGitHub, cmake, gcc, gcc-unwrapped }:

stdenv.mkDerivation rec {
  version = "4.2.1";
  pname = "messer-slim";

  src = fetchFromGitHub {
    owner = "MesserLab";
    repo = "SLiM";
    rev = "v${version}";
    sha256 = "sha256-ba5I/bsDNAhDb1Kq0lWTC6YgpZ1PpeHPmB/vXx/JRK0=";
  };

  nativeBuildInputs = [ cmake gcc gcc-unwrapped ];

  cmakeFlags = [ "-DCMAKE_AR=${gcc-unwrapped}/bin/gcc-ar"
                 "-DCMAKE_RANLIB=${gcc-unwrapped}/bin/gcc-ranlib" ];

  meta = {
     description = "An evolutionary simulation framework";
     homepage = "https://messerlab.org/slim/";
     license = with lib.licenses; [ gpl3 ];
     maintainers = with lib.maintainers; [ bzizou ];
     platforms = lib.platforms.all;
  };
}
