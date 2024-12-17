function lbundle -d "Ruby bundler with local Gemfile"
    if test -e Gemfile.local
        echo "Using Gemfile.local ..."
        BUNDLE_GEMFILE="Gemfile.local" /Users/Oleh_Volynets/.rbenv/shims/bundle $argv
    else
        /Users/Oleh_Volynets/.rbenv/shims/bundle $argv
    end
end
