from django.shortcuts import render

# Create your views here.

def dashboard(request):
    return render(request,'dashboard.html')


def report(request):
    return render(request,'monthly_report.html')



