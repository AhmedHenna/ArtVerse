//
//  CertificateView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

import SwiftUI

struct CertificateView: View {
    @StateObject private var viewModel = CertificateViewModel()
    
    var certificate: Certificate?
    
    var defaultCertificate: Certificate {
        viewModel.certificates.indices.contains(0) ? viewModel.certificates[0] :
        Certificate(title: "Procreate", subtitle: "Certificate", date: "July 27, 2023", instructor: "Cayde-6", image: "Procreate")
    }
    
    var selectedCertificate: Certificate {
        certificate ?? defaultCertificate
    }
    

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text(selectedCertificate.title)
                    .font(.title3.weight(.semibold))
                Text(selectedCertificate.subtitle)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text(selectedCertificate.date.uppercased())
                    .font(.footnote.weight(.semibold))
                Text("Instructor: \(selectedCertificate.instructor)")
                    .font(.footnote.weight(.medium))
            }
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            Image(selectedCertificate.image)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10)
                .padding(9)
                .background(Color(UIColor.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .strokeStyle(cornerRadius: 16)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        )
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
    }
}

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateView()
    }
}
