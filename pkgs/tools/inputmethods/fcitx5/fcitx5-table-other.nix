{ lib, stdenv
, fetchFromGitHub
, cmake
, extra-cmake-modules
, gettext
, libime
, boost
, fcitx5
}:

stdenv.mkDerivation rec {
  pname = "fcitx5-table-other";
  version = "5.1.2";

  src = fetchFromGitHub {
    owner = "fcitx";
    repo = pname;
    rev = version;
    hash = "sha256-S9no+OxCwZUfRUKdpbBBqUSeVVs8uI9otV4ndqsgaXM=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    gettext
    libime
    boost
    fcitx5
  ];

  meta = with lib; {
    description = "Some other tables for Fcitx";
    homepage = "https://github.com/fcitx/fcitx5-table-other";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ poscat ];
    platforms = platforms.linux;
  };
}
