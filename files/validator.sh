#!/bin/bash
#--no-genesis-fetch \
#--no-snapshot-fetch \
#--skip-startup-ledger-verification \
export RUST_LOG=solana_metrics::metrics=warn,solana_gossip::cluster_info=warn,info
export SOLANA_METRICS_CONFIG=host=http://metrics-pool.shyft.to:8086,db=mainnet-beta,u=scratch_writer,p=topsecret
exec /mnt/solana/target/release/solana-validator \
--identity /home/solana/rpc_node.json \
--entrypoint entrypoint.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint2.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint3.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint4.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint5.mainnet-beta.solana.com:8001 \
--known-validator PUmpKiNnSVAZ3w4KaFX6jKSjXUNHFShGkXbERo54xjb \
--known-validator Ninja1spj6n9t5hVYgF3PdnYz2PLnkt7rvaw3firmjs \
--known-validator ChorusmmK7i1AxXeiTtQgQZhQNiXYU84ULeaYF1EH15n \
--known-validator CakcnaRDHka2gXyfbEd2d3xsvkJkqsLw2akB3zsN1D2S \
--known-validator SerGoB2ZUyi9A1uBFTRpGxxaaMtrFwbwBpRytHefSWZ \
--known-validator FLVgaCPvSGFguumN9ao188izB4K4rxSWzkHneQMtkwQJ \
--known-validator qZMH9GWnnBkx7aM1h98iKSv2Lz5N78nwNSocAxDQrbP \
--known-validator GiYSnFRrXrmkJMC54A1j3K4xT6ZMfx1NSThEe5X2WpDe \
--known-validator LA1NEzryoih6CQW3gwQqJQffK2mKgnXcjSQZSRpM3wc \
--known-validator Certusm1sa411sMpV9FPqU5dXAYhmmhygvxJ23S6hJ24 \
--known-validator 9bkyxgYxRrysC1ijd6iByp9idn112CnYTw243fdH2Uvr \
--known-validator 12ashmTiFStQ8RGUpi1BTCinJakVyDKWjRL6SWhnbxbT \
--known-validator FdaysQ2BZWUGBy8nqFgiudnrhzJp4xChQ8B4zJdc2JZB \
--rpc-port 8899 \
--dynamic-port-range 8002-8099 \
--no-port-check \
--halt-on-trusted-validators-accounts-hash-mismatch \
--gossip-port 8001 \
--no-voting \
--private-rpc \
--enable-cpi-and-log-storage \
--disable-banking-trace \
--enable-rpc-transaction-history \
--wal-recovery-mode skip_any_corrupted_record \
--accounts /mnt/solana-accounts \
--ledger /mnt/solana-ledger \
--replay-slots-concurrently \
--expected-genesis-hash 5eykt4UsFv8P8NJdTREpY1vzqKqZKvdpKuc147dw2N9d \
--limit-ledger-size 50000000 \
--rpc-send-default-max-retries 3 \
--rpc-send-service-max-retries 3 \
--rpc-send-retry-ms 2000 \
--full-rpc-api \
--incremental-snapshot-interval-slots 1000 \
--accounts-index-memory-limit-mb 350 \
--accounts-index-scan-results-limit-mb 250 \
--accounts-db-cache-limit-mb 10240 \
--no-os-disk-stats-reporting \
--minimal-snapshot-download-speed 21943040 \
--tpu-use-quic \
--log /mnt/logs/solana-validator.log
