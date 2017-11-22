SWIFTCFLAGS=

all:
	swift build $(addprefix -Xcc ,${SWIFTCFLAGS})

test:
	swift test $(addprefix -Xcc ,${SWIFTCFLAGS})
