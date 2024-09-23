# make psql work
if [ -d "/opt/homebrew/opt/libpq/bin" ]; then
	export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi
