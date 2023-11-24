{
  stdenv,
  lib,
  fetchgit,
  pkg-config,
  gtk3,
  gnome,
  gdk-pixbuf,
  librsvg,
  gsound,
  libmanette,
  gettext,
  itstool,
  libxml2,
  clutter,
  clutter-gtk,
  wrapGAppsHook,
  meson,
  ninja,
  python3,
  vala,
  desktop-file-utils,
}:

stdenv.mkDerivation rec {
  pname = "quadrapassel";
  version = "40.2-d0790971";

  src = fetchgit {
    url = "https://gitlab.gnome.org/GNOME/quadrapassel";
    rev = "d0790971554b611f3c39cada9aa8eaa970b5e2e2";
    sha256 = "h0X7ydhiTB8QpBmbJTKxfT5miIJ5/6v00ykPZJcDXBk=";
  };

  nativeBuildInputs = [
    meson
    ninja
    python3
    vala
    desktop-file-utils
    pkg-config
    gnome.adwaita-icon-theme
    libxml2
    itstool
    gettext
    wrapGAppsHook
  ];

  buildInputs = [
    gtk3
    gdk-pixbuf
    librsvg
    libmanette
    gsound
    clutter
    libxml2
    clutter-gtk
  ];

  passthru = {
    updateScript = gnome.updateScript {
      packageName = pname;
      attrPath = "gnome.${pname}";
    };
  };

  meta = with lib; {
    description = "Classic falling-block game, Tetris";
    homepage = "https://wiki.gnome.org/Apps/Quadrapassel";
    license = licenses.gpl2Plus;
    maintainers = teams.gnome.members;
    platforms = platforms.linux;
  };
}
