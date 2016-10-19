execute "import key to RDS keystore" do
  command <<-EOF
    cd /tmp;
    wget http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem;
    csplit -sz rds-combined-ca-bundle.pem '/-BEGIN CERTIFICATE-/' '{*}';
    if [ $(keytool -list -storepass #{node['alfresco']['truststore_password']} -storetype #{node['alfresco']['truststore_type']}  -keystore #{node['alfresco']['truststore_file']} |grep rds |wc -l) == 12 ]
     then echo "is OK"
    else
     for CERT in xx*; do ALIAS=$(openssl x509 -noout -text -in $CERT | perl -ne 'next unless /Subject:/; s/.*CN=//; print'); keytool -import -keystore #{node['alfresco']['truststore_file']}  -storepass #{node['alfresco']['truststore_password']} -storetype #{node['alfresco']['truststore_type']} -noprompt -alias "$ALIAS" -file $CERT; done
    fi
    EOF
  ignore_failure true
end

ssl_db_conf = " -Djavax.net.ssl.keyStore=#{node['alfresco']['keystore_file']} -Djavax.net.ssl.keyStorePassword=#{node['alfresco']['keystore_password']}"
node.default['alfresco']['repo_tomcat_instance']['java_options']['others'] = "#{node['alfresco']['repo_tomcat_instance']['java_options']['others']} #{ssl_db_conf}"