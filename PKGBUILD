# Maintainer: 3j14 <hello@3j14.de>

pkgname=rbackupd
pkgver=0.0.1
pkgrel=1
pkgdesc='Bash helpers and systemd units for managing backups with restic'
arch=('any')
license=('BSD-3-Clause')
depends=('bash' 'restic' 'libnotify')
makedepends=()
source=(
    "https://github.com/3j14/rbackupd/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('2ce332e0dec7e4f82fd54711b0496b933d775ed81b9814ae072fe66be2493cf4')

package() {
    install -Dm644 "${pkgname}-${pkgver}/systemd/rbackupd@.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${pkgname}-${pkgver}/systemd/rcheckd@.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${pkgname}-${pkgver}/systemd/rforgetd@.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${pkgname}-${pkgver}/systemd/rbackupd@.timer" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${pkgname}-${pkgver}/systemd/rcheckd@.timer" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${pkgname}-${pkgver}/systemd/rforgetd@.timer" -t "${pkgdir}/usr/lib/systemd/user"

    install -Dm755 "${pkgname}-${pkgver}/src/rbackupd.sh" -T "$pkgdir/usr/bin/rbackupd"
    install -Dm755 "${pkgname}-${pkgver}/src/rcheckd.sh" -T "$pkgdir/usr/bin/rcheckd"
    install -Dm755 "${pkgname}-${pkgver}/src/rforgetd.sh" -T "$pkgdir/usr/bin/rforgetd"
}

