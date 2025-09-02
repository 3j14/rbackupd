# Maintainer: 3j14 <hello@3j14.de>

pkgname=rbackupd
pkgver=0.0.2
pkgrel=1
pkgdesc='Bash helpers and systemd units for managing backups with restic'
arch=('any')
license=('BSD-3-Clause')
depends=('bash' 'restic' 'libnotify')
makedepends=()
source=(
    "https://github.com/3j14/rbackupd/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('2e4af74f82e56d2b5d09e01a3a43ec4da613fe4302edc7c382327fd85556701a')

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

