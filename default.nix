{ nixpkgs ? import <nixpkgs> {} }:
nixpkgs.stdenv.mkDerivation rec {
  name = "libarib25";
  src = nixpkgs.fetchFromGitHub {
    owner = "stz2012";
    repo = "libarib25";
    rev = "5b24f2fe0f3f7110735d9c53210a42486ebc4661";
    sha256 = "08z5wjd0cbinxq2flr560wzmvw751bdyj8c9j0dacj7sf9rkl016";
  };
  nativeBuildInputs = with nixpkgs; [ cmake git pkgconfig ];
  buildInputs = with nixpkgs; [ pcsclite ];
  patchPhase = ''
sed -i '138d' CMakeLists.txt
  '';
}
