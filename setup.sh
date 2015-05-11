#!/bin/bash
if [ ! -d "/nvwm" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  echo "/nvwm not found"
  exit 1
fi
# Copy files to /fastwp directory
cp -r /dcfiles/* /nvwm
DC_DBPASS=$(openssl rand -base64 10 | tr -d '+=/')
for name in $(compgen -v DC_); do
    eval value=\$$name
    sed -i "s|${name}|${value}|g" /nvwm/docker-compose.yml
done

echo ""
echo "   cd nvwm && . ./post.sh"
echo ""
