################################################################################
#
# file
#
################################################################################

FILE_VERSION = 5.34
FILE_SITE = ftp://ftp.astron.com/pub/file
FILE_DEPENDENCIES = host-file zlib
HOST_FILE_DEPENDENCIES = host-zlib
FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
FILE_INSTALL_STAGING = YES
FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
HOST_FILE_CONF_OPTS = --disable-libseccomp

ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
FILE_CONF_OPTS += --enable-libseccomp
FILE_DEPENDENCIES += libseccomp
else
FILE_CONF_OPTS += --disable-libseccomp
endif

define HOST_FILE_ADD_HOSTBUILD_MARKER
	touch $(HOST_FILE_SRCDIR)src/.host-build-marker
endef

HOST_FILE_POST_CONFIGURE_HOOKS += HOST_FILE_ADD_HOSTBUILD_MARKER

$(eval $(autotools-package))
$(eval $(host-autotools-package))
