installdirectory=/var/tmp
softwaredirectory=mediawiki
mediawiki=REL1_37

git clone https://gerrit.wikimedia.org/r/p/mediawiki/core.git ${softwaredirectory} \
  --branch ${mediawiki} \
  --depth 1 \
  --recurse-submodules \
  --shallow-submodules \
  --single-branch \
  --no-tags

cat << EOF > composer.local.json
{
        "require": {
                "mediawiki/semantic-media-wiki": "~4",
                "mediawiki/semantic-result-formats": "*",
                "mediawiki/maps": "*",
                "mediawiki/page-forms": "*",
                "professional-wiki/modern-timeline": "*",
                "mediawiki/mermaid": "*",
                "mediawiki/semantic-extra-special-properties": "*",
                "mediawiki/graph-viz": "*",
                "symfony/process": "*",
                "mediawiki/validator": "*"
        },
        "extra": {
                "merge-plugin": {
                        "include": [
                                "extensions/SyntaxHighlight_GeSHi/composer.json",
                                "extensions/ConfirmEdit/composer.json",
                                "extensions/SpamBlacklist/composer.json",
                                "extensions/Nuke/composer.json",
                                "extensions/SmiteSpam/composer.json",
                                "extensions/AntiSpoof/composer.json",
                                "extensions/UserMerge/composer.json",
                                "extensions/FlickrAPI/composer.json"
                        ]
                }
        }
}
EOF
