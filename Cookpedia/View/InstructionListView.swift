//
//  InstructionListView.swift
//  Cookpedia
//
//  Created by Bilal Dallali on 23/11/2024.
//

import SwiftUI

struct InstructionListView: View {
    
    @Binding var instructions: [CreateRecipeView.Instruction]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach($instructions) { $instruction in
                InstructionSlotView(
                    instruction: $instruction.text,
                    images: $instruction.images,
                    onDelete: { _ in
                    if let index = instructions.firstIndex(where: { $0.id == instruction.id }) {
                        instructions.remove(at: index)
                    }
                }, index: instructions.firstIndex(where: { $0.id == instruction.id }) ?? 0
                )
            }
            
            Button {
                instructions.append(CreateRecipeView.Instruction())
            } label: {
                Text("add instruction")
            }
        }
    }
}

#Preview {
    @Previewable @State var sampleInstructions: [CreateRecipeView.Instruction] = [
        CreateRecipeView.Instruction(text: "Mix the ingredients.", images: [UIImage(systemName: "photo")!]),
        CreateRecipeView.Instruction(text: "Bake at 180°C.", images: []),
        CreateRecipeView.Instruction(text: "Let it cool before serving.", images: [])
    ]
    
    InstructionListView(instructions: $sampleInstructions)
}
