#!/usr/bin/env bash

# Pulls the latest data from the ACNH API
for resource in bugs fish sea
do
    curl https://acnhapi.com/v1a/${resource} \
    | jq -c '[.[] | {
        id,
        name: .name."name-USen",
        icon_uri,
        location: .availability.location,
        rarity: .availability.rarity,
        hours: .availability."time-array",
        months_north: .availability."month-array-northern",
        months_south: .availability."month-array-southern",
        price,
        price_cj: ."price-cj",
        price_flick: ."price-flick",
    }]' \
    > _data/${resource}.json
done
