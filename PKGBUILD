# Maintainer: 3j14 <hello@3j14.de>

pkgname=rbackupd
pkgver=0.0.3
pkgrel=1
pkgdesc='Bash helpers and systemd units for managing backups with restic'
arch=('any')
license=('BSD-3-Clause')
depends=('bash' 'restic' 'libnotify')
makedepends=()
source=(
    "https://github.com/3j14/rbackupd/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('228b772dc20bddea8270d15ea13463b16327d92aeca35b114bd53ffd37dcf1f3')

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

