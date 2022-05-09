{ fetchurl, lib, stdenv, fuse, zlib, openssl, libuuid, pkg-config, bzip2 }:

stdenv.mkDerivation rec {
  version = "20201230";
  pname = "libewf";

  src = fetchurl {
    url = "https://github.com/libyal/libewf/releases/download/${version}/libewf-experimental-${version}.tar.gz";
    sha256 = "sha256-10r4jPzsA30nHQzjdg/VkwTG1PwOskwv8Bra34ZPMgc=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ zlib openssl libuuid fuse ];

  meta = {
    description = "Library for support of the Expert Witness Compression Format";
    homepage = "https://github.com/libyal/libewf/";
    license = lib.licenses.lgpl3;
    platforms = lib.platforms.linux;
  };
}
