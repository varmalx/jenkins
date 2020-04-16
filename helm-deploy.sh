
LastRelease=`helm list | grep jenkins-nodeapp | cut -f1`

if [ $LastRelease ] ; then
    echo " App Previous version $LastRelease"
    helm uninstall $LastRelease
    helm inspect jenkins-nodeapp
    helm list | grep jenkins-nodeapp

else
    echo "App Fresh Install"
    helm inspect jenkins-nodeapp
    helm install jenkins-nodeapp --namespace default --generate-name
    helm list | grep jenkins-nodeapp

fi